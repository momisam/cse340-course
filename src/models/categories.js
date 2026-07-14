import db from "./db.js";

const getAllCategories = async () => {
  const sql = `
    SELECT category_id, name
    FROM category
    ORDER BY name;
  `;

  const result = await db.query(sql);
  return result.rows;
};

export { getAllCategories };
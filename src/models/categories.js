import db from './db.js';

const getAllCategories = async () => {
    try {
        const query = `
            SELECT category_id, name
            FROM category
            ORDER BY name;
        `;

        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error(error);
        throw error;
    }
};

export { getAllCategories };
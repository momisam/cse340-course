import db from './db.js';

const getAllProjects = async () => {
    try {
        const query = `
            SELECT
                project_id,
                organization_id,
                title,
                description,
                location,
                project_date
            FROM project
            ORDER BY project_date;
        `;

        const result = await db.query(query);

        return result.rows;
    } catch (error) {
        console.error(error);
        throw error;
    }
};

export { getAllProjects };
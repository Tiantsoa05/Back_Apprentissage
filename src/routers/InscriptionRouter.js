import { Router } from 'express';
import { inscription } from '../controllers/InscriptionController.js';

const router = Router();

router.post('/inscription', inscription);

export default router;

